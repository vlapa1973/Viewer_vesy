//*******************************************************************
//  Zasor2 - viewer
//  2021.03.06 - 2021.09.05
//  v.  037
//*******************************************************************
import processing.pdf.*;

String filePath = "data/";            //  путь для сохранения копии файла базы
String filePath1;                     //  путь для сохранения файла базы (Ядиск)
String put = "data/Custom/";          //  путь для сохранения копии файла настроек
String otwes = "OTWESY/";             //  путь для сохранения отвесов
int count = 0;
int select = 0;
int selectData = 0;
int selectDataEdit = 0;
int h = 17;
int w = 80;
int otH = 13;
int otW = 10;
int shift = 10;

boolean flagHighlight = false;
boolean flagWork = false;
boolean flagBoss = false;
boolean flagNext = false;

int[] tablo = {10, 30, 1350, 900};
int[] tabloW = {0, 40, 135, 270, 335, 370, 435, 500, 565, 630, 690, 
  745, 955, 1035, 1110, 1185, 1270, tablo[2]};

String[][] data = new String[60][20];
String inputData = "";
int numberReport;
int millisOld = 0;

int index = 0;

int sumN1 = 0;
int sumN = 0;
int sumChist = 0;
int sumArenda = 0;
int sumDopSor = 0;
int sumSum = 0;

int rowCount = 0;

int s = tablo[1] + tablo[3] - 11;

Table table;
PFont myFont;

//***************************************************** 
void settings() {  
  size(tablo[2] + 20, tablo[3] + 60);
}
void setup() {
  myFont = createFont("Arial", 12, true);
  textFont(myFont);
  
  JSONArray values;
  values = loadJSONArray(put + "option.json");
  JSONObject animal = values.getJSONObject(0);
  filePath1 = animal.getString("filePath");
  println(filePath1);
  table = loadTable(filePath1 + "base.csv");
  if (table == null) {
    fill(0);
    textSize(50);
    text("File 'base.csv' not found !", 50, 150);
  }
}
//*****************************************************
void draw() {
  if (millis() >= millisOld + 1000) {
    table = loadTable(filePath1 + "base.csv", "header");
    if (table.getRowCount() == rowCount) {
      return;
    } else {
      rowCount = table.getRowCount();
      fill(255);
      rect(tablo[0], tablo[1], tablo[2], tablo[3]);
      reset();
    }
  }
}

//****************************************************
void reset() {
  count = 0;
  sumN1 = 0;
  sumN = 0;
  sumChist = 0;
  sumArenda = 0;
  sumDopSor = 0;
  sumSum = 0;
  visible();
}

//****************************************************
String printData(String d) {
  String d1 = "";
  if (d.length() == 0 || d.length() == 1) {
    d1 = "";
  } else if (d.length() < 2) {
    d1 = d.substring(d.length() - 1, d.length());
  } else if (d.length() < 3) {
    d1 = d.substring(d.length() - 2, d.length());
  } else if (d.length() < 4) {
    d1 = d.substring(d.length() - 3, d.length());
  } else if (d.length() < 5) {
    d1 = d.substring(d.length() - 4, d.length() - 3) + "'" + d.substring(d.length() - 3, d.length());
  } else if (d.length() < 6) {
    d1 = d.substring(d.length() - 5, d.length() - 3) + "'" + d.substring(d.length() - 3, d.length());
  } else if (d.length() < 7) {
    d1 = d.substring(d.length() - 6, d.length() - 3) + "'" + d.substring(d.length() - 3, d.length());
  } else if (d.length() < 8) {
    d1 = d.substring(d.length() - 7, d.length() - 6) + "'" + d.substring(d.length() - 6, d.length() - 3) + "'" + d.substring(d.length() - 3, d.length());
  }
  return d1;
}

//*****************************************************
