"use client";

import { useSelector } from "react-redux";
import Image from "next/image";
import { RootState } from "@/state/store";
import { useEffect, useState } from "react";
import { nuiCallback } from "@/lib/nuiCallback";
import { useSearchParams } from "next/navigation";
import Header from "@/components/Header";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import AllMenu from "@/components/AllMenu";
import ArmorMenu from "@/components/ArmorMenu";

export default function Home() {
  const searchParams = useSearchParams();
  const display = useSelector((state: RootState) => state.app.display);

  if (!display && !searchParams.get("preview")) return null;

  return (
    <div className="flex justify-center items-center h-screen">
      <div className=" relative w-[1200px] h-[900px]">
        <div className=" absolute inset-0 z-1">
          <Image src="/ipad.svg" alt="Ipad" fill />
        </div>
        <div className=" absolute inset-0 flex justify-center items-center text-black">
          <div className="bg-[#0C0C0C] w-[1110px] h-[800px] rounded-3xl p-20">
            <div className="flex flex-col gap-2">
              <Header
                Title="MARKETPLACE"
                description="Velkommen til los santos blackmarket."
              />
              <Tabs defaultValue="all" className="w-full h-full">
                <TabsList className="bg-[#0d0b0b]">
                  <TabsTrigger value="all">Alle ting</TabsTrigger>
                  <TabsTrigger value="amor">Armor</TabsTrigger>
                  <TabsTrigger value="våben">Våben</TabsTrigger>
                  <TabsTrigger value="ammo">Ammo</TabsTrigger>
                  <TabsTrigger value="food">Mad</TabsTrigger>
                  <TabsTrigger value="auto">Auto</TabsTrigger>
                </TabsList>
                <TabsContent value="all" className="mt-5">
                  <AllMenu />
                </TabsContent>
                <TabsContent value="amor" className="mt-5">
                  <ArmorMenu />
                </TabsContent>
              </Tabs>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
