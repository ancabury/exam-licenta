// SEPTEMBRIE 2014 - OOP

// a
public class Vehicul {
  private string culoare;

  public Vehicul(string c){
    culoare = c;
  }

  public string toString(){
    return culoare;
  }
}

// b
public class Masina : Vehicul {
  private int numarDeUsi;

  public Masina(string c, int nr){
    base(c);
    numarDeUsi = nr;
  }

  public override string toString(){
    return base() + numarDeUsi.ToString();
  }
}

// c
public List<Vehicul> create(){
  List<Vehicul> list = new List<Vehicul>();
  list.Add(new Masina("alba", 5));
  list.Add(new Vehicul("rosie"));
  list.Add(new Masina("albastra", 2));
  return list;
}

// d
public List<Vehicul> filter(List<Vehicul> list, string c){
  List<Vehicul> newList = new List<Vehicul>();
  foreach(Vehicul v in list){
    if (v.toString().Contains(c))
      newList.Add(v);
  }
  return newList;
}

static void Main(){
  List<Vehicul> l1 = create();
  string c;
  Console.Write("character = ");
  c = Console.ReadLine();
  List<Vehicul> l2 = filter(l1, c);
  Console.WriteLine("Lista l2 este:");
  foreach(Vehicul v in l2)
    Console.WriteLine(v.toString());
}
