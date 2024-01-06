/**
 * @file app.ts
 * @description This file is authored by PJ-Script and owned by Patrick Jakobsen.
 * @date 2024-01-06
 *
 * @author PJ-Script
 *
 * The code in this file is subject to the terms and conditions defined in
 * the MIT license, which can be found in the accompanying LICENSE file,
 * or at https://opensource.org/licenses/MIT.
 */

import { createSlice, PayloadAction } from "@reduxjs/toolkit";

export interface appState {
  display: boolean;
}

const initialState: appState = {
  display: false,
};

const appSlice = createSlice({
  name: "app",
  initialState,
  reducers: {
    setDisplay: (state, action: PayloadAction<boolean>) => {
      state.display = action.payload;
    },
  },
});

export const { setDisplay } = appSlice.actions;

export default appSlice.reducer;
