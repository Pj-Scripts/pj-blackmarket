/**
 * @file store.ts
 * @description This file is authored by PJ-Script and owned by Patrick Jakobsen.
 * @date 2024-01-06
 *
 * @author PJ-Script
 *
 * The code in this file is subject to the terms and conditions defined in
 * the MIT license, which can be found in the accompanying LICENSE file,
 * or at https://opensource.org/licenses/MIT.
 */

import { configureStore } from "@reduxjs/toolkit";
import appReducer from "./reducers/app";

const store = configureStore({
  reducer: {
    app: appReducer,
  },
  devTools: process.env.NODE_ENV !== "production" ? true : false,
});

export default store;

export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;
