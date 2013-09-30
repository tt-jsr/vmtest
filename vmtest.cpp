// vmtest.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "../VMEngine/machine.h"
#include "../VMEngine/Assembler.h"
#include "../VMEngine/Data.h"
#include "../VMEngine/Function.h"
#include <fstream>

using namespace vm;
using namespace std;

class Print : public Function
{
    void printit(Machine& machine, Data *pData)
    {
        switch (pData->type)
        {
            case Data::INT:
                {
                    Int *p = (Int *)pData;
                    cout << "Print: " << p->n << endl;
                }
                break;
            case Data::STRING:
                {
                    String *p = (String *)pData;
                    cout << "Print: " << p->str << endl;
                }
                break;
            case Data::VARIABLE:
                {
                    Variable *var = (Variable *)pData;
                    Data *pData;
                    if (machine.GetVariable(var->name, pData))
                    {
                        printit(machine, pData);
                    }
                    else
                    {
                        cout << "Variable " << var->name << " not found" << endl;
                    }
                }
                break;
        }
    }

    void OnExecute(Machine& machine)
    {
        Data *pData = machine.stack.Pop();
        printit(machine, pData);
    }
};

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

    Print print;
    machine.RegisterFunction("Print", &print);
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
    Data *pData;
    machine.GetGlobalVariable("answer", pData);
    std::cout << "Answer: " << ((Int *)pData)->n << std::endl;
	return 0;
}

