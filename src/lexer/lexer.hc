#include "src/lexer/tokens.hc"
#include "src/io/io.hc"

static token *current_token;

token* lex_stream()
{
  U8 c = read_char();
  if (!c)
    return NULL;

  if (c >= '0' && c <= '9')
  {
    U8 *number = MAlloc(32);
    number[0] = c;
   
    I64 size = 1;
    while (peek_char() >= '0' && peek_char() <= '9')
    {
      c = read_char();
      number[size++] = c;
    }

    number[size] = '\0';
    return create_token(NUMBER, number);
  }
  else
  {
    switch (c)
    {
      case '+':
        return create_token(PLUS, "+");
      case '-':
        return create_token(MINUS, "-");
      case '*':
        return create_token(MUL, "*");
      case '^':
        return create_token(POW, "^");
      case '/':
        return create_token(DIV, "/");
      case '(':
        return create_token(LPAREN, "(");
      case ')':
        return create_token(RPAREN, ")");
      default:
        return NULL;
    }
  }
  return NULL;
}

token* peek_token()
{
  if (current_token)
    return current_token;
  current_token = lex_stream();
  return current_token;
}

token* read_token()
{
  destroy_token(current_token);
  current_token = NULL;

  token *t = peek_token();
  return t;
}

