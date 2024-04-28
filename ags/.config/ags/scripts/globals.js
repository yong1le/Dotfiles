import { volumeOSD, brightnessOSD, micOSD } from "./OSD.js";


export default function setupGlobals() {
  globalThis.volumeOSD = volumeOSD;
  globalThis.brightnessOSD = brightnessOSD;
  globalThis.micOSD = micOSD;
}