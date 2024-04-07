export const ColorPicker = () =>
  Widget.EventBox({
    on_primary_click: () =>
      Utils.execAsync(["bash", "-c", "hyprpicker -n -f hex | wl-copy"]),
    hexpand: true,
    class_name: "utility",
    child: Widget.Icon({
      icon: "raindrop",
    }),
  });

export const ScreenshotClipboard = () =>
  Widget.EventBox({
    on_primary_click: () =>
      Utils.execAsync(["hyprshot", "-m", "region", "--clipboard-only"]),
    hexpand: true,
    class_name: "utility",
    child: Widget.Icon({
      icon: "view-fullscreen-symbolic",
    }),
  });

export const ScreenshotSave = () =>
  Widget.EventBox({
    on_primary_click: () => Utils.execAsync(["hyprshot", "-m", "region"]),
    hexpand: true,
    class_name: "utility",
    child: Widget.Icon({
      icon: "document-save-symbolic",
    }),
  });
