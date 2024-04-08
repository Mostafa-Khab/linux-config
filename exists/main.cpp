#include <iostream>
#include <filesystem>

inline void print_help()
{
  std::cout << "exists:-\n checks if a certain path exists. you can use exit code\n";
  std::cout << "it prints file/folder name if it exists\n";
}

int main(int argc, char* argv[])
{
  if(argc < 2)
  {
    print_help();
    return -1;
  }

  std::filesystem::path path(argv[1]);
  if(!std::filesystem::exists(path))
  {
    return -1;
  }

  std::cout << path.string();

  return 0;
}
