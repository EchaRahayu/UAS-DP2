program ongbangkelkur;
uses crt;

type
    barang = record
        nama: string;
        beratOns: integer;
        beratKg: real;
        jarak: integer;
        ongkir: longint;
    end;

var
    data: array[1..20] of barang;
    n, i: integer;
    lanjut: char;

function onsKeKg(ons: integer): real;
begin
    onsKeKg := ons / 10;
end;

function hitungOngkir(berat: real; jarak: integer): longint;
var
    tarifBerat, tarifJarak: longint;
begin
    if berat <= 1 then
        tarifBerat := 10000
    else if berat <= 5 then
        tarifBerat := 25000
    else
        tarifBerat := 50000;

    if jarak <= 10 then
        tarifJarak := 15000
    else if jarak <= 40 then
        tarifJarak := 25000
    else
        tarifJarak := 50000;

    hitungOngkir := tarifBerat + tarifJarak;
end;

procedure inputBarang(var b: barang);
begin
    write('Nama barang : ');
    readln(b.nama);

    repeat
        write('Berat (ons) : ');
        readln(b.beratOns);
        if b.beratOns <= 0 then
            writeln('Berat harus lebih dari 0!');
    until b.beratOns > 0;

    repeat
        write('Jarak (km)  : ');
        readln(b.jarak);
        if b.jarak <= 0 then
            writeln('Jarak harus lebih dari 0!');
    until b.jarak > 0;

    b.beratKg := onsKeKg(b.beratOns);
    b.ongkir  := hitungOngkir(b.beratKg, b.jarak);
end;

procedure tampilSemua(jumlah: integer);
begin
    if jumlah = 0 then
    begin
        writeln('Belum ada data.');
        exit;
    end;

    writeln('--Daftar Barang--');
    for i := 1 to jumlah do
    begin
        writeln(i, '. ', data[i].nama);
        writeln('   Berat : ', data[i].beratOns, ' ons (',
                data[i].beratKg:0:1, ' kg)');
        writeln('   Jarak : ', data[i].jarak, ' km');
        writeln('   Ongkir: Rp', data[i].ongkir);
        writeln;
    end;
end;

begin
    clrscr;
    n := 0;

    repeat
        n := n + 1;
        writeln;
        writeln('Input barang ke-', n);
        inputBarang(data[n]);

        write('Tambah barang lagi? (y/t): ');
        readln(lanjut);
    until (lanjut = 't') or (n = 20);

    clrscr;
    tampilSemua(n);
    writeln('Total data barang: ', n);
    writeln('Terima kasih kurir, semoga lancar');
end.
