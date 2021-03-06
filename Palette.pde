class ColorEx {

  float amp = 255;    // Amplitude (ref 0) [0, 255];
  float offset = 0.0; // offset [0.0;TWO_PI]
  float ex = 1.0;     // ]-inf;+inf[ - [-10.0;+10.0] recommended

  ColorEx() {
  }

  float v(float v) {
    return map(cos(offset + v * ex), -1, 1, 0, amp);
  }
}

class Palette {

  ColorEx r = new ColorEx();
  ColorEx g = new ColorEx();
  ColorEx b = new ColorEx();

  String extension = ".plt";
  String repertory = "data/palette/";

  Palette() {
  }

  color col(float v) {    // v [0.0;1.0]
    return color(r.v(v), g.v(v), b.v(v));
  }

  void savePalette(String fileName) {
    String[] data = new String[9];
    data[0] = str(r.amp);
    data[1] = str(r.offset);
    data[2] = str(r.ex);

    data[3] = str(g.amp);
    data[4] = str(g.offset);
    data[5] = str(g.ex);

    data[6] = str(b.amp);
    data[7] = str(b.offset);
    data[8] = str(b.ex);

    String path = "data/palette/" + fileName + ".plt";

    saveStrings(path, data);
  }

  void loadPalette(String fileName) {
    String[] data = loadStrings("data/palette/" + fileName + ".plt");
    r.amp    = float(data[0]);
    r.offset = float(data[1]);
    r.ex     = float(data[2]);

    g.amp    = float(data[3]);
    g.offset = float(data[4]);
    g.ex     = float(data[5]);

    b.amp    = float(data[6]);
    b.offset = float(data[7]);
    b.ex     = float(data[8]);
  }

  String formatPath(String fileName) {
    return repertory + fileName + extension;
  }
}
