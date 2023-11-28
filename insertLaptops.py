import requests
import string
import random
import mysql.connector
from mysql.connector import Error
from mysql.connector import errorcode
from dotenv import load_dotenv
    
if __name__ == '__main__':

    compuStoreConnection = mysql.connector.connect(
        host="eks.c19gkk3ng7md.ap-south-1.rds.amazonaws.com",
        user="root",
        password="Bh101299",
        database="userdata"
    )
    compuStoreCursor = compuStoreConnection.cursor(prepared=True)
        ##LaptopModelLaptopModel(model_id, model, brand, cpu_specs, display_size, resolution, operating_system, gpu_specs, launch_date, thumbnail, price)
    compustoreInsertLaptop = "INSERT INTO LaptopModel VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
    
    pID = set()
    mID = set()
    
    k = 0
        
    laptopFile=open("laptops.txt", "r")
    print("Start...")
    
    lines = laptopFile.readlines()
    
    for line in lines:
        line = line.split(",")
        
        model = line[0]
        
        brand = line[1]
        
        model_id = brand + ''.join(random.choice(string.digits) for _ in range(5))
        while model_id in mID:
            model_id = brand + ''.join(random.choice(string.digits) for _ in range(5))
        mID.add(model_id)
        
        cpu = line[2]
        displaySize = float(line[3])
        resolution = line[4]
        os = line[5]
        gpu = line[6]
        launchDate = line[7] 
                
        thumbnail = line[8]

        price = float(line[9]) * 130.00
        
        ##LaptopModel(model_id, model, brand, cpu_specs, display_size, resolution, operating_system, gpu_specs, launch_date, thumbnail, price)
        compuStoreLaptopValues = (model_id, model, brand, cpu, displaySize, resolution, os, gpu, launchDate, thumbnail, price)
        
        compuStoreCursor.execute(compustoreInsertLaptop, compuStoreLaptopValues)
        
        
        ##ModelStockInfo(model_id, amt_in_stock)
        amt_in_stock = random.randint(250,280)
 
        
        for _ in range(amt_in_stock):
            
            ##Branch1 item
            product_id1 = random.randint(1,2147483647)
            while product_id1 in pID:
                product_id1 = random.randint(1,2147483647)
            pID.add(product_id1)

    
        k+=1
        compuStoreConnection.commit()

        print ("Laptop Items added")
        print("Got model info ... %s." % k)