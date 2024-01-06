/**
 * @file nuiCallback.ts
 * @description This file is authored by PJ-Script and owned by Patrick Jakobsen.
 * @date 2024-01-06
 *
 * @author PJ-Script
 *
 * The code in this file is subject to the terms and conditions defined in
 * the MIT license, which can be found in the accompanying LICENSE file,
 * or at https://opensource.org/licenses/MIT.
 */

export const nuiCallback = async <T extends Record<string, any>, K>(
  endpoint: `/${string}`,
  data?: T,
  cb?: (result: K) => void
): Promise<void> => {
  try {
    const result = await fetch(
      `https://${process.env.NEXT_PUBLIC_RESOURCE_NAME}${endpoint}`,
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: JSON.stringify(data || {}),
      }
    );
    if (!cb) return;
    cb(await result.json());
  } catch (error) {
    console.log(error);
    throw error;
  }
};
