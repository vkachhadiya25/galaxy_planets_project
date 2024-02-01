class HomeModel {
  int? id;
  String? name, image, title, moons,orbit, ecliptic, year, velocity, period, day;


  HomeModel({this.id, this.name, this.image, this.title, this.moons, this.orbit,
    this.ecliptic, this.year, this.velocity, this.period, this.day});

  factory HomeModel.mapToModel(Map m1) {
    return HomeModel(
      id: m1['id'],
      name: m1['name'],
      image: m1['image'],
      title: m1['title'],
      moons: m1['number of known moons'],
      orbit: m1['eccentricity of orbit'],
      ecliptic: m1['inclination of orbit to ecliptic'],
      year: m1['year'],
      velocity: m1['escape velocity'],
      period: m1['rotation period'],
      day: m1['solar day']

    );
  }
}
