/**
 * @file AllMenu.tsx
 * @description This file is authored by PJ-Script and owned by Patrick Jakobsen.
 * @date 2024-01-06
 *
 * @author PJ-Script
 *
 * The code in this file is subject to the terms and conditions defined in
 * the MIT license, which can be found in the accompanying LICENSE file,
 * or at https://opensource.org/licenses/MIT.
 */

"use client";

import Image from "next/image";
import { Button } from "./ui/button";
import { ScrollArea } from "./ui/scroll-area";
import { nuiCallback } from "@/lib/nuiCallback";
import { useEffect, useState } from "react";

interface ItemData {
  price?: number;
  item: string;
  itemLabel: string;
  itemType: string;
  imageName: string;
}

const AllMenu = () => {
  const [itemDataArray, setItemDataArray] = useState<ItemData[]>([]);

  useEffect(() => {
    const messageHandler = (event: MessageEvent<ItemData[]>) => {
      const data = event.data;
      console.log("Received data:", data);

      setItemDataArray(data);
    };

    window.addEventListener("message", messageHandler);

    return () => {
      window.removeEventListener("message", messageHandler);
    };
  }, []);

  const buyItem = (item: string) => {
    nuiCallback("/item", { item });
  };

  return (
    <ScrollArea className="w-full h-[590px]">
      <div className="grid grid-cols-4 gap-5">
        {itemDataArray.map((itemData, idx) => (
          <div
            key={itemData.item}
            className="w-[200px] h-[250px] bg-[#0C0C0C]  border-2 border-[#313131] rounded-xl flex items-center justify-center"
          >
            <div className=" relative flex flex-col w-full h-full">
              <Image
                src={`/${itemData.item}.png`}
                alt="logo"
                width={400}
                height={400}
                className="rounded-xl"
              />
              <div className="bg-[#242424]/40 backdrop-blur-sm absolute inset-0 z-1 w-full h-[100px] mt-[147px] rounded-b-xl flex flex-col">
                <div className="flex flex-row justify-between w-full px-2 mt-4">
                  <h1 className="text-white text-sm font-semibold">
                    {itemData.itemLabel}
                  </h1>
                </div>
                <h1 className="text-white text-sm font-semibold px-2 mt-1">
                  Pris: {itemData.price} DKK
                </h1>
                <div className="w-full px-2">
                  <Button
                    onClick={() => buyItem(itemData.item)}
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
