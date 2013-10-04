// vmtest.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "../VMEngine/machine.h"
#include "../VMEngine/Assembler.h"
#include "../VMEngine/Data.h"
#include <fstream>

using namespace vm;
using namespace std;

int _tmain(int argc, _TCHAR* argv[])
{
    Machine machine;
    Assembler assem;
    std::ifstream strm;
    strm.open("prog.asm");
    if (strm.is_open() == false)
    {
        std::cout <<  "Cannot open file" << std::endl;
        return 1;
    }
    try
	{
        assem.Assemble(machine, strm);
	}
    catch (std::exception& ex)
	{
        std::cout << ex.what() << std::endl;
        return 1;
	}

    while (machine.IsHalted() == false)
    {
        try
		{
            //machine.DumpMachine(std::cout);
            machine.Clock();
		}
        catch (std::exception& ex)
		{
            std::cout << ex.what() << std::endl;
            return 1;
		}
    }

	return 0;
}

