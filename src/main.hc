#include "src/parser/parser.hc"

U8 Main(U32 argc, U8 **argv)
{
  if (argc != 2)
  {
    "%s\n", "Invalid number of arguments.";
    return 2;
  }

  U8 *expression = argv[1];
  init_stream(expression);

  "%d\n", Z();
  
  destroy_stream();
  return 0;
}
