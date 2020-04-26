import 'streets.dart';

void main() {
    final Intersection split = Intersection("Harpy", "Clover");
	final Intersection split2 = Intersection.road(split.one, "Main");
    final Intersection split3 = Intersection.existing(split.two, split2.two);
    final Car car = Car(split.one);
    car.pass();
    car.pass();
    car.pass();
    car.pass();
    car.pass();
    car.pass();
    car.pass();
    car.pass();
    car.pass();
    print("$split, $split2, $split3, ${car.intersection}");
}
