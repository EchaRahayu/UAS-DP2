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

    arrBarang = array[1..20] of barang;

var
    data: arrBarang;
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
    write('Nama barang     : '); readln(b.nama);
    write('Berat (ons)     : '); readln(b.beratOns);
    write('Jarak (km)      : '); readln(b.jarak);

    b.beratKg := onsKeKg(b.beratOns);
    b.ongkir  := hitungOngkir(b.beratKg, b.jarak);
end;

procedure tampilBarang(b: barang; index: integer); 
begin
    writeln(index, '. ', b.nama);
    writeln('   Berat : ', b.beratOns, ' ons (', b.beratKg:0:1, ' kg)');
    writeln('   Jarak : ', b.jarak, ' km');
    writeln('   Ongkir: Rp', b.ongkir);
end;

procedure tampilSemua(var data: arrBarang; jumlah: integer);
begin
    if jumlah = 0 then
    begin
        writeln('Belum ada data tersimpan.');
        exit;
    end;

    writeln('Daftar Barang: ');
    for i := 1 to jumlah do
    begin
        tampilBarang(data[i], i);
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
    tampilSemua(data, n);
    writeln('Total data barang: ', n);
    writeln;
    writeln('Terima kasih telah menggunakan program!');

end.

