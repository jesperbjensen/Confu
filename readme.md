# Use Cases

## Scanner QR-kode, ikke medlem
* En person scanner en QR-kode
* Han bliver sendt til en bestemt URL, med en token i URL'en.
* Brugeren får en velkommen besked, og skal skrive sin email.
* Brugeren får Award skærmen, og har nu fået det badge, som QR-koden gav

## Scanner QR-kode, alderede medlem
* En person scanner en QR-kode
* Han bliver sendt til en bestemt URL, med en token i URL'en
* Brugeren får Award skærmen, og har nu fået det badge, som QR-koden gav

## Scanner QR-kode, men koden er brugt eller ikke tilgængelig endnu (recurring)
* En person scanner en QR-kode
* Han bliver sendt til en bestemt URL, med en token i URL'en
* Han får en besked om at han ikke kan få det badge, eller at han skal vente x-antal minutter.

## To personer vil gerne lave en QR-shake
* En person sætter sin telefon op til at vise en QR kode
* En anden person scanner koden.
* Hvis den anden person ikke er oprettet, skal han først oprette sig.
* Anden person, får en besked om at de nu har lavet et QR handshake, og han ser nu info på den første person.
* Den første person trykker ok, og ser nu info om den anden person.
* De kan efterfølgende begge se alle dem de har lavet QR-shakes med.

# DB Model
* Badge: Navn
* Token: BadgeID
* User: Email
* Award: User, Badge