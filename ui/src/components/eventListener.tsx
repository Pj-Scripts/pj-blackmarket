/**
 * @file eventListener.tsx
 * @description This file is authored by PJ-Script and owned by Patrick Jakobsen.
 * @date 2024-01-06
 *
 * @author PJ-Script
 *
 * The code in this file is subject to the terms and conditions defined in
 * the MIT license, which can be found in the accompanying LICENSE file,
 * or at https://opensource.org/licenses/MIT.
 */

import { nuiCallback } from "@/lib/nuiCallback";
import { useCallback, useEffect } from "react";
import { useDispatch } from "react-redux";

interface EventListenerProps {
  children: React.ReactNode;
}

export default function EventListener({ children }: EventListenerProps) {
  const dispatch = useDispatch();

  const onKeyDown = useCallback((event: KeyboardEvent) => {
    if (event.key === process.env.NEXT_PUBLIC_CLOSE_KEY) nuiCallback("/close");
  }, []);

  const onMessage = useCallback(
    (event: MessageEvent) => {
      const { type, data }: { type: string; data: any } = event.data;
      if (type && type != "ACTION" && type != "PARTIAL_STATE") {
        dispatch({ type, payload: data });
      }
    },
    [dispatch]
  );

  useEffect(() => {
    document.addEventListener("keydown", onKeyDown);
    window.addEventListener("message", onMessage);

    return () => {
      document.removeEventListener("keydown", onKeyDown);
      window.addEventListener("message", onMessage);
    };
  }, [onMessage, onKeyDown]);

  return children;
}
