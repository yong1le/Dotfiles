import { volumeOSD, brightnessOSD, micOSD, ppdOSD } from "./OSD.js";
import { switchPPD } from "./ppd.js";


export default function setupGlobals() {
  globalThis.volumeOSD = volumeOSD;
  globalThis.brightnessOSD = brightnessOSD;
  globalThis.micOSD = micOSD;
  globalThis.ppdOSD = ppdOSD;
  globalThis.switchPPD = switchPPD
}
