export function volumeOSD() {
  if (
    !App.getWindow("osd-volume") ||
    App.getWindow("osd-volume").visible
  )
    return;

  App.openWindow("osd-volume");
  setTimeout(() => {
    App.closeWindow("osd-volume");
  }, 3000);
}

export function brightnessOSD() {
  if (
    !App.getWindow("osd-brightness") ||
    App.getWindow("osd-brightness").visible
  )
    return;

  App.openWindow("osd-brightness");
  setTimeout(() => {
    App.closeWindow("osd-brightness");
  }, 3000);
}

export function micOSD() {
  if (
    !App.getWindow("osd-mic") ||
    App.getWindow("osd-mic").visible
  )
    return;

  App.openWindow("osd-mic");
  setTimeout(() => {
    App.closeWindow("osd-mic");
  }, 3000);
}


export function ppdOSD() {
  if (
    !App.getWindow("osd-ppd") ||
    App.getWindow("osd-ppd").visible
  )
    return;

  App.openWindow("osd-ppd");
  setTimeout(() => {
    App.closeWindow("osd-ppd");
  }, 3000);
}
