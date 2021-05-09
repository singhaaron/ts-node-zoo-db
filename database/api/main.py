import random
import linecache

class ZooData:
    def __init__(self):
        self.lengh_file_names=10500
        self.department_names = ['Animal Keeper','Zoo Director','Assistant Director','Volunteer Coordinator']
        self.email_domains =['gmail','yahoo','hotmail','aol','msn','sbcglobal']
        self.zoo_tickets = [('Safari Park',random.uniform(10.5, 75.5)),('Sea World',random.uniform(10.5, 75.5)),('Botanical Garden',random.uniform(10.5, 75.5))]
        self.animal_types=['Amphibian','Mammal','Bird','Reptile','Invertebrate']
        self.skin_types = ['Brownie Skin','Green Skin','Blue Skin','Yellow Skin','Red Skin']
        self.hair_types =['Brown Hair','Blue Hair','Silly Hair','Fun Hair']
    def Employees(self,size):
        table = 'Employees'
        attributes = ['name','dept_id','position','age','ssn']
        mysql_table={'table':'Employees','attributes':['name','dept_id','position','age','ssn']}
        with open("./names/names.txt",'r') as fr: # Name API 
            with open("./names/employees.sql",'w') as fw: # Create Employee Data 
                fw.write('insert into {}({}) values \n'.format(table,','.join(attributes)))
                for i in range(size-1):
                    name = linecache.getline('./names/names.txt', random.randint(1,self.lengh_file_names)).strip()
                    position = random.choice(self.department_names)
                    age = random.randint(1,65)
                    ssn=str(random.randint(200, 500)) + str(random.randint(100,500))+str(random.randint(1000,9999))
                    dpt = random.randint(1,3)
                    fw.write("('{}',{},'{}',{},{}),\n".format(name,dpt,position,age,ssn))
                name = linecache.getline('./names/names.txt', random.randint(1,self.lengh_file_names)).strip()
                position = random.choice(self.department_names)
                dpt = random.randint(1,3)
                age = random.randint(1,65)
                ssn=str(random.randint(200, 500)) + str(random.randint(100,500))+str(random.randint(1000,9999))
                fw.write("('{}',{},'{}',{},{});".format(name,dpt,position,age,ssn))
        return self
    def Cusomers(self,size):
        table = 'Customers'
        attributes = ['name','phone','email_addr']
        with open("./names/names.txt","r") as fr:
            with open("./names/customers.sql",'w') as fw:
                fw.write('insert into {} ({}) values\n'.format(table,','.join(attributes)))
                for i in range(size-1):
                    name = linecache.getline('./names/names.txt', random.randint(1,self.lengh_file_names)).strip()
                    phone = str(1)+str(random.randint(100000000,999999999))
                    email = name + '@'+ random.choice(self.email_domains) + '.com'
                    fw.write("('{}',{},'{}'),\n".format(name,phone,email))
                name = linecache.getline('./names/names.txt', random.randint(1,self.lengh_file_names)).strip()
                phone = str(1)+str(random.randint(100000000,999999999))
                email = name + '@'+ random.choice(self.email_domains) + '.com'
                fw.write("('{}',{},'{}');".format(name,phone,email))
        return self
    def Animals(self,size):
        mysql_table = {
            "tables":['Animals']+ self.animal_types,
            "attributes":[['type,animal,name,birthdate'],['animal_id','skin_type','egg_size'],['animal_id','hair_type'],['animal_id','fly_height','wing_span','beak_length'],['animal_id','egg_tempature'],['animal_id','body_length','leg_count']]
        }
        with open("./names/names.txt","r") as fr:
            with open("./names/animals.sql","w") as fw:
                for i in range(size):
                    birthday = str(random.randint(1900,2020)) +'-'+ str(random.randint(1,12))+ '-'+ str(random.randint(1,25))
                    random_animal = random.choice(range(len(self.animal_types)))
                    name = linecache.getline('./names/names.txt', random.randint(1,self.lengh_file_names)).strip()
                    fw.write("insert into Animals (type,name,birthdate) values ({},'{}','{}');\n".format(random_animal+1,name,birthday))
                    fw.write(self.Animals_Switch(random_animal+1,mysql_table,i+1))
        return self
    def Animals_Switch(self,type,mysql_table,id):
        switcher= {
            # Amphibian
            1: "insert into {}s ({}) values ({},'{}',{});\n".format(mysql_table['tables'][type],','.join(mysql_table['attributes'][type]),id,random.choice(self.skin_types),random.randint(1,100)),
            # Mammal
            2: "insert into {}s ({}) values ({},'{}');\n".format(mysql_table['tables'][type],','.join(mysql_table['attributes'][type]),id,random.choice(self.hair_types)),
            # Bird
            3: "insert into {}s ({}) values ({},{},{},{});\n".format(mysql_table['tables'][type],','.join(mysql_table['attributes'][type]),id,random.randint(1,25),random.randint(1,50),random.randint(1,80)),
            # Reptile
            4: "insert into {}s ({}) values ({},{});\n".format(mysql_table['tables'][type],','.join(mysql_table['attributes'][type]),id,random.uniform(0,20)),
            # Invertebrate
            5: "insert into {}s ({}) values ({},{},{});\n".format(mysql_table['tables'][type],','.join(mysql_table['attributes'][type]),id,random.randint(0,20),random.randint(0,10)),
        }
        return switcher.get(type)
    def Animals_In_Exhibits(self,size):
        table = 'Lives_In'
        attributes = ['animal_id','exhibit_id']
        with open("./names/animals_in_exhibits.sql","w") as fw:
            fw.write('insert into {} ({}) values\n'.format(table,','.join(attributes)))
            for i in range(1,size):
                fw.write("({},{}),\n".format(i,random.randint(1,3)))
            fw.write("({},{});".format(size,random.randint(1,3)))
    def Takes_Care(self,animals_size,employer_size):
        table = 'Takes_Care'
        attributes = ['animal_id','employee_id']
        with open("./names/takes_care.sql","w") as fw:
            fw.write('insert into {} ({}) values\n'.format(table,','.join(attributes)))
            for i in range(1,animals_size):
                fw.write("({},{}),\n".format(i,random.randint(1,employer_size)))
            fw.write("({},{});".format(animals_size,random.randint(1,employer_size)))
    def Cleans(self,employer_size):
        table = 'Cleans'
        attributes = ['employee_id','exhibit_id']
        with open("./names/cleans.sql","w") as fw:
            fw.write('insert into {} ({}) values\n'.format(table,','.join(attributes)))
            for i in range(1,employer_size):
                fw.write("({},{}),\n".format(i,random.randint(1,3))) # Exhibit Size is only 3
            fw.write("({},{});".format(employer_size,random.randint(1,3))) #Exhibit Size is only 3
    def Helps(self,employer_size,customer_size):
        table = 'Helps'
        attributes = ['employee_id','customer_id']
        employer_order = random.sample(range(employer_size),employer_size)
        customer_order = random.sample(range(customer_size),customer_size)
        with open("./names/helps.sql","w") as fw:
            fw.write('insert into {} ({}) values\n'.format(table,','.join(attributes)))
            for i in range(1,customer_size):
                fw.write("({},{}),\n".format(employer_order[i],customer_order[i])) 
            fw.write("({},{});".format(employer_order[employer_size-1],customer_order[customer_size-1]))
    def Purchase(self,customer_size,ticket_size):
        table = 'Purchase'
        attributes = ['customer_id','ticket_id']
        with open("./names/purchase.sql","w") as fw:
            fw.write('insert into {} ({}) values\n'.format(table,','.join(attributes)))
            for i in range(1,customer_size):
                fw.write("({},{}),\n".format(i,random.randint(1,ticket_size))) 
            fw.write("({},{});".format(customer_size,ticket_size))
    def Visits(self,customer_size,exhibit_size):
        table = 'Visits'
        attributes = ['customer_id','exhibit_id']
        with open("./names/visits.sql","w") as fw:
            fw.write('insert into {} ({}) values\n'.format(table,','.join(attributes)))
            for i in range(1,customer_size):
                fw.write("({},{}),\n".format(i,random.randint(1,exhibit_size))) 
            fw.write("({},{});".format(customer_size,exhibit_size))
    def random_data(self,arg):
        switch_case = {
            'birthday':'10',
            'phone':str(1)+str(random.randint(100000000,999999999)),
            'ssn':10,
        }
        pass

z1 = ZooData()
# Entitys
z1.Employees(size=500)
z1.Customers(size=500)
z1.Animals(size=10000)
# Relationships
z1.Animals_In_Exhibits(animals_size=1000)
z1.Takes_Care(animals_size=10000,employer_size=500)
z1.Cleans(employer_size=500)
z1.Helps(employer_size=250,customer_size=250)
z1.Purchase(customer_size=500,ticket_size=3)
z1.Visits(customer_size=497,exhibit_size=3)

