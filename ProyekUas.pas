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

function hitungOngkir(var b: barang): longint;
var
    tarifBerat, tarifJarak: longint;
begin
    b.beratKg := b.beratOns / 10;

    if b.beratKg <= 1 then
        tarifBerat := 10000
    else if b.beratKg <= 5 then
        tarifBerat := 25000
    else
        tarifBerat := 50000;

    if b.jarak <= 10 then
        tarifJarak := 15000
    else if b.jarak <= 40 then
        tarifJarak := 25000
    else
        tarifJarak := 50000;

    hitungOngkir := tarifBerat + tarifJarak;
end;

procedure inputBarang(var b: barang);
begin
    write('Nama barang: '); readln(b.nama);
    write('Berat (ons): '); readln(b.beratOns);
    write('Jarak (km): '); readln(b.jarak);

    b.ongkir := hitungOngkir(b);
end;

procedure tampilData(data: arrBarang; jumlah: integer);
begin
    if jumlah = 0 then
    begin
        writeln('Belum ada data.');
        exit;
    end;

    for i := 1 to jumlah do
    begin
        writeln(i, '. ', data[i].nama);
        writeln('   Berat: ', data[i].beratOns, ' ons (',
                data[i].beratKg:0:1, ' kg)');
        writeln('   Jarak: ', data[i].jarak, ' km');
        writeln('   Ongkir: Rp', data[i].ongkir);
        writeln;
    end;
end;

begin
    clrscr;
    n := 0;
    repeat
        n := n + 1;
        writeln('Input barang ke-', n);
        inputBarang(data[n]);

        write('Tambah barang lagi? (y/t): ');
        readln(lanjut);
    until (lanjut = 't') or (n = 20);

    clrscr;
    tampilData(data, n);
    writeln('Total data barang: ', n);
    writeln('Terima kasih wok, Semoga lancar');
end.
