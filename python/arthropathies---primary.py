# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2024.

import sys, csv, re

codes = [{"code":"N038.00","system":"readv2"},{"code":"70741.0","system":"readv2"},{"code":"98710.0","system":"readv2"},{"code":"53334.0","system":"readv2"},{"code":"61906.0","system":"readv2"},{"code":"68933.0","system":"readv2"},{"code":"103289.0","system":"readv2"},{"code":"62953.0","system":"readv2"},{"code":"2194.0","system":"readv2"},{"code":"90859.0","system":"readv2"},{"code":"58590.0","system":"readv2"},{"code":"107875.0","system":"readv2"},{"code":"8017.0","system":"readv2"},{"code":"50465.0","system":"readv2"},{"code":"8103.0","system":"readv2"},{"code":"31559.0","system":"readv2"},{"code":"22634.0","system":"readv2"},{"code":"94911.0","system":"readv2"},{"code":"62937.0","system":"readv2"},{"code":"101937.0","system":"readv2"},{"code":"3936.0","system":"readv2"},{"code":"53339.0","system":"readv2"},{"code":"49812.0","system":"readv2"},{"code":"68096.0","system":"readv2"},{"code":"73438.0","system":"readv2"},{"code":"73921.0","system":"readv2"},{"code":"99398.0","system":"readv2"},{"code":"53817.0","system":"readv2"},{"code":"107847.0","system":"readv2"},{"code":"49472.0","system":"readv2"},{"code":"110574.0","system":"readv2"},{"code":"103172.0","system":"readv2"},{"code":"33790.0","system":"readv2"},{"code":"M02","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('postinfective-and-reactive-arthropathies-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["arthropathies---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["arthropathies---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["arthropathies---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
