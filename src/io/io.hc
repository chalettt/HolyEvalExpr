extern "c" U0 *memcpy(U0 *dst, U0 *src, I64 mem);
extern "c" I64 strlen(U8 *str);

class stream
{
  U8 *data;
  U64 size;
};

// Cannot have U8 types as global variables.
static U64 current_char;
static stream *input;
static U64 index;

U0 init_stream(U8 *s)
{
  current_char = '\0';
  index = 0;
  input = MAlloc(sizeof(stream));
  input->data = MAlloc(256);
  input->size = strlen(s);
  memcpy(input->data, s, input->size);
  input->data[input->size] = '\0';
}

U64 peek_char()
{
  current_char = input->data[index];
  return current_char;
}

U64 read_char()
{
  current_char = '\0';
  U64 c = peek_char();
  index++;
  return c;
}

