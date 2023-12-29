"use client";

import AllMenu from "@/components/AllMenu";
import Header from "@/components/Header";
import { RootState } from "@/state/store";
import Image from "next/image";
import { useSearchParams } from "next/navigation";
import { useSelector } from "react-redux";

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
              <div className="w-full h-full">
                <AllMenu />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
