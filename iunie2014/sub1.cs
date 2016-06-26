// IUNIE 2014 - OOP

// a
public class Student {
  private string nume;

  public Student(string n){
    nume = n;
  }

  public virtual string toString(){
    return nume;
  }
}

// b
public class StudentBursier : Student {
  private int valoareBursa;

  public StudentBursier(string n, int val){
    base(b);
    valoareBursa = val;
  }

  public override string toString(){
    return base() + valoareBursa.ToString();
  }
}

// c
public Dictionary<string, Student> create(){
  Dictionary<string, Student> dictionary = new Dictionary<string, Student>();
  dictionary.Add("Ionescu", new Student("Ionescu"));
  dictionary.Add("Popescu", new StudentBursier("Popescu", 200));
  return dictionary;
}

// d
public bool exists(Dictionary<string, Student> dict, string c){
  foreach(Student s in dict.Values)
    if (s.toString().Contains(c))
      return true;
  return false;
}

// e
static void Main(){
  Dictionary<string, Student> dict = create();
  string input;
  Console.Write("input = ");
  input = Console.ReadLine();

  if (dict.ContainsKey(input))
    Console.WriteLine("Obiectul cautat este: {0}", dict[input].toString);
  else
    Console.WriteLine("Nu exista");

  if (exists(dict, input[0]))
    Console.WriteLine("exista");
  else
    Console.WriteLine("nu exista");
}
