#include "src/lexer/lexer.hc"

extern "c" I64 atoi(U8* str);
extern "c" U0 exit(I64 code);

/* Evaluates the input using the following LL(1) grammar:
 *
 * (1) Z -> S$
 * (2) S -> PU 
 * (3) U -> +PU 
 * (4)  | ε
 * (5) P -> RV
 * (6) V -> *RV
 * (7)  | /RV
 * (8)  | ^RV
 * (9)  | ε
 * (10) R -> + R 
 * (11)  | - R 
 * (12)  | I
 * (13) I -> integer
 * (14)  | (S)
 *
*/

I64 Z();
I64 S();
I64 U();
I64 P();
I64 V(I64 left);
I64 R();
I64 I();

I64 fpow(I64 a, I64 b)
{
  if (b < 0)
    return 0;

  if (b == 0)
    return 1;

  if (b == 1)
    return a;

  if (b % 2 == 0)
    return fpow(a*a, b/2);

  if (b % 2 != 0)
    return a*fpow(a*a, (b-1)/2);
}

U0 err_invalid()
{
  "%s\n", "Invalid token found.";
  exit(2);
}

F64 Z() 
{
  token* t = peek_token();
  if (t)
    return S();
  return 0;
}

F64 S()
{
  return P() + U();
}

F64 U()
{
  token* t = peek_token();
  if (t && t->type == PLUS)
  {
    read_token();
    return P() + U();
  }
  return 0;
}

F64 P()
{
  return V(R());
}

F64 V(I64 left)
{
  token* t = peek_token();
  if (t && t->type == MUL)
  {
    read_token();
    return V(left * R());
  }
  else if (t && t->type == DIV)
  {
    read_token();
    return V(left / R());
  }
  else if (t && t->type == POW)
  {
    read_token();
    return V(fpow(left, R()));
  }
  return left;
}

I64 R()
{
  token* t = peek_token();
  if (t && t->type == PLUS)
  {
    read_token();
    return R();
  }
  else if (t && t->type == MINUS)
  {
    read_token();
    return -R();
  }
  return I();
}

I64 I()
{
  token* t = peek_token();
  if (t && t->type == NUMBER)
  {
    I64 integer = atoi(t->data);
    read_token();
    return integer;
  }
  else if (t && t->type == LPAREN)
  {
    read_token();
    I64 result = S();
    if (peek_token() && peek_token()->type == RPAREN)
    {
      read_token();
      return result;
    }
    err_invalid();
  }
  err_invalid();
}

