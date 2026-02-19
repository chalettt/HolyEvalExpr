// Doing this nonsense because hcc does not support enums.
#define NUMBER 0
#define PLUS 1
#define MINUS 2
#define MUL 3
#define DIV 4
#define POW 5
#define LPAREN 6
#define RPAREN 7

class token 
{
  U8 *data;
  I32 type;
};

token* create_token(U8 token_type, U8 *data)
{
  if (token_type > 7)
    return NULL;

  token *new_token = MAlloc(sizeof(token));
  if (!new_token)
    return NULL;

  new_token->data = data;
  new_token->type = token_type;
  return new_token;
}

U0 destroy_token(token *t) 
{
  Free(t);
}

