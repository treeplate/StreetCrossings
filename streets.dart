class _Street {
  _Street(this._intersections, this.name);
  List<Intersection> _intersections;

  ///Name of this street
  final String name;

  ///Intersections this goes through
  List<Intersection> get intersections => _intersections;

  ///String representation of this object.
  String toString() => name;
}

class Intersection {
  _Street _one;
  _Street _two;

  ///Second road
  _Street get two => _two;

  ///First road
  _Street get one => _one;

  ///String representation of this object.
  String toString() => "$one and $two";
  
  ///Intersection of 2 new roads named `one` and `two` 
  Intersection(String one, String two){
    _one = _Street([this], one);
    _two = _Street([this], two);
  }
  
  ///Intersection of `one` and a new road named `two` 
  Intersection.road(_Street one, String two){
    _one = one;
    this.one.intersections.add(this);
    _two = _Street([this], two);
  }
  
  ///Intersection of `one` and `two`
  Intersection.existing(_Street one, _Street two){
    _one = one;
    _two = two;
    this.two.intersections.add(this);
    this.one.intersections.add(this);
  }
}

class Car {
  Car(this.road);

  _Street road;

  int _index = 0;
  
  set index(int newIndex) {
    if (newIndex == road.intersections.length || newIndex == -1) {
      print("U-turning at dead end");
      uTurn();
    } else {
      print("Index is now $newIndex");
      _index = newIndex;
    }
  }

  int get index => _index;

  int increment = 1;
  bool plus1 = true;

  Intersection get intersection => road.intersections[index];

  void pass() { 
    print("\nMoving forward from $road $index");
    index += increment;
    print("Moved forward, now at $road $index\n");
  }

  void turnRight() {
    plus1 = true;
    increment = 1;
    _Street tempRoad = road;
    bool isFirst = road.intersections[index].one == road; 
    road = isFirst ? road.intersections[index].two : road.intersections[index].one;
    index = road.intersections.indexOf(tempRoad.intersections[index]) + increment;
  }

  void turnLeft() {
    increment = -1;
    plus1 = false;
    _Street tempRoad = road;
    bool isFirst = road.intersections[index].one == road; 
    road = isFirst ? road.intersections[index].two : road.intersections[index].one;
    index = road.intersections.indexOf(tempRoad.intersections[index]) + increment;
  }

  void uTurn() {
    plus1 =! plus1;
    increment = -increment;
    index += increment;
  }
}