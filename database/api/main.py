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
        """[Employee table]
        Args:
            size ([size of employees]): [using random module to make some random employees]
        Returns:
            [self]: [to chain with other methods on the instance]
        """
        table = 'Employees'
        attributes = ['name','position','age','ssn']
        mysql_table={'table':'Employees','attributes':['name','position','age','ssn']}
        with open("./names/names.txt",'r') as fr: # Name API 
            with open("./names/employees.sql",'w') as fw: # Create Employee Data 
                fw.write('insert into {}({}) values \n'.format(table,','.join(attributes)))
                for i in range(size-1):
                    name = linecache.getline('./names/names.txt', random.randint(1,self.lengh_file_names)).strip()
                    position = random.choice(self.department_names)
                    age = random.randint(1,65)
                    ssn=str(random.randint(200, 500)) + str(random.randint(100,500))+str(random.randint(1000,9999))
                    fw.write("('{}','{}',{},{}),\n".format(name,position,age,ssn))
                name = linecache.getline('./names/names.txt', random.randint(1,self.lengh_file_names)).strip()
                position = random.choice(self.department_names)
                age = random.randint(1,65)
                ssn=str(random.randint(200, 500)) + str(random.randint(100,500))+str(random.randint(1000,9999))
                fw.write("('{}','{}',{},{});".format(name,position,age,ssn))
        return self
    def Cusomers(self,size):
        """[Customer Table]
        Args:
            size ([size of customers]): [using random module to make some random customers]
        Returns:
            [self]: [chain other methods to instance]
        """
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
    def Animals_In_Exhibits(self):
        """[Relationship table for Animals in exhibits]
        """
        pass
    def random_data(self,arg):
        """[NOT DONE YET]
        Args:
            arg ([type of random data needed]): [return value of key passed in arg]
        """
        switch_case = {
            'birthday':'10',
            'phone':str(1)+str(random.randint(100000000,999999999)),
            'ssn':10,
        }
        pass
        

z1 = ZooData().Employees(500).Cusomers(500).Animals(10000)

