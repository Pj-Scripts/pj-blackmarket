/**
 * @file providers.tsx
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

import store from "@/state/store";
import { ThemeProvider } from "next-themes";
import { Provider } from "react-redux";
import EventListener from "./eventListener";

interface ProvidersProps {
  children: React.ReactNode;
}

export default function Providers({ children }: ProvidersProps) {
  return (
    <Provider store={store}>
      <EventListener>{children}</EventListener>
    </Provider>
  );
}
