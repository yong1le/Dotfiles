import {BrightnessFloatingIndicator, VolumeFloatingIndicator} from "./widgets/FloatingIndicator/FloatingIndicator.js";
import Bar from "./widgets/Bar/Bar.js";
import ControlCentre from "./widgets/ControlCentre/ControlCentre.js";
import NotificationPopups from "./widgets/Notification/Notification.js";
import PopupCalendar from "./widgets/Calendar/calendar.js";

App.config({
  style: "./style.css",
  windows: [
    Bar(0),
    Bar(1),
    ControlCentre(),
    NotificationPopups(),
    VolumeFloatingIndicator(),
    BrightnessFloatingIndicator(),
    PopupCalendar(),
  ],
});
