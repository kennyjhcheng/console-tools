import csv
import sys
import os

'''
USAGE:
python bmo-convert-dates.py file/path.csv output_name
'''

file_path = sys.argv[1]

output_path = f'{os.path.dirname(file_path)}/{sys.argv[2]}.csv'

def convert_date(date):
    '''
    Convert date from YYYYMMDD to MM/DD/YYYY
    '''
    return f'{date[4:6]}/{date[6:8]}/{date[0:4]}'

with open(output_path, mode='w', newline='') as statement_file:
    with open(file_path, mode='r') as csv_file:
        lines = csv_file.readlines()
        if 'Following data' in lines[0]:
            lines = lines[2:]

        csv_reader = csv.DictReader(lines, delimiter=',')
        csv_writer = csv.DictWriter(statement_file, fieldnames=csv_reader.fieldnames)
        csv_writer.writeheader()
        for row in csv_reader:
            row['Transaction Date'] = convert_date(row['Transaction Date'])
            row['Posting Date'] = convert_date(row['Posting Date'])
            csv_writer.writerow(row)


    
    
    