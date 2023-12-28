"use client";
import { data } from "@/lib/items";
import Image from "next/image";
import { Button } from "./ui/button";
import { ScrollArea } from "./ui/scroll-area";
import { nuiCallback } from "@/lib/nuiCallback";

const AllMenu = () => {
  function buyItem(data: any) {
    nuiCallback(`/${data}`, {}, (result: string) => {
      console.log("Result", result);
    });
  }

  return (
    <ScrollArea className="w-full h-[590px]">
      <div className="grid grid-cols-4 gap-5">
        {data.AllData.map((item, idx) => (
          <div
            key={idx}
            className="w-[200px] h-[250px] bg-[#0C0C0C]  border-2 border-[#313131] rounded-xl flex items-center justify-center"
          >
            <div className=" relative flex flex-col w-full h-full">
              <Image
                src={item.ImageName}
                alt="logo"
                width={400}
                height={400}
                className="rounded-xl"
              />
              <div className="bg-[#242424]/40 backdrop-blur-sm absolute inset-0 z-1 w-full h-[100px] mt-[147px] rounded-b-xl flex flex-col">
                <div className="flex flex-row justify-between w-full px-2 mt-4">
                  <h1 className="text-white text-sm font-semibold">
                    {item.name}
                  </h1>
                  <h1 className="text-white text-sm">{item.effect}</h1>
                </div>
                <h1 className="text-white text-sm font-semibold px-2 mt-1">
                  Pris: {item.price} DKK
                </h1>
                <div className="w-full px-2">
                  <Button
                    onClick={() => buyItem(item.itemName)}
                    className="w-full bg-white text-black h-[27px] mt-2 hover:bg-white/80 hover:text-black"
                  >
                    Køb
                  </Button>
                </div>
              </div>
            </div>
          </div>
        ))}
      </div>
    </ScrollArea>
  );
};

export default AllMenu;
