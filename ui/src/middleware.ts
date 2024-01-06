/**
 * @file middleware.ts
 * @description This file is authored by PJ-Script and owned by Patrick Jakobsen.
 * @date 2024-01-06
 *
 * @author PJ-Script
 *
 * The code in this file is subject to the terms and conditions defined in
 * the MIT license, which can be found in the accompanying LICENSE file,
 * or at https://opensource.org/licenses/MIT.
 */

import { NextRequest, NextResponse } from "next/server";

// This is only to allow for previewing the site outside FiveM - it's not needed for production

export function middleware(req: NextRequest) {
  const userAgent = req.headers.get("user-agent");

  if (req.nextUrl.searchParams.get("preview") === "true") return;
  if (userAgent && !userAgent.includes("CitizenFX")) {
    return NextResponse.redirect(`${req.url}?preview=true`);
  }

  return;
}

export const config = {
  matcher: "/",
};
