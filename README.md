# Internet alkalmazásfejlesztés - csoportos projekt
Az elkészült alkalmazásban a felhasználó regisztráció után tud bejelentkezni, és elérni a tartalmat. Minden regisztrált felhasználó vagy normál szintű, vagy emelt jogosultságú, adminisztrátori felhasználó, ezt bejelentkezés után jelzi az alkalmazás.

Bejelentkezés után egy megadott kérdésben szavazhat. Szavazás után megtekintheti a szavazás állását, de még egyszer már nem szavazhat. A kijelentkezés gombbal kijelentkezhet.

## Technikai információk
Az adatbázis egy Apache Derby szerver, egy users nevű adatbázissal és egy users táblával. Localhoston kell futnia, az alapértelmezett, 1527-es porton. A feltöltött zip állomány része a `users.zip` fájl, amely tartalmazza az adatbázist, az üres users táblával.