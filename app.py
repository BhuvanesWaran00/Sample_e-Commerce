from flask import Flask, session, redirect, render_template, request, url_for, flash
from forms import SignupForm, LoginForm
from random import sample
from werkzeug.security import check_password_hash,generate_password_hash
import logging
from dotenv import load_dotenv


import os

app = Flask(__name__)

app.secret_key = "kniajj3m747m2y2378y3h2h8sda"


import mysql.connector
from mysql.connector import Error
from mysql.connector import errorcode


compuStoreConnection = mysql.connector.connect(
    host="test.c19gkk3ng7md.ap-south-1.rds.amazonaws.com", 
    user="root", 
    password="Bh101299", 
    database="userdata"
)
compuStoreCursor = compuStoreConnection.cursor(prepared=True)

@app.route("/")
def index():
    form = LoginForm()
    try:
        compuStoreCursor.execute("SELECT * FROM LaptopModel")
        models = compuStoreCursor.fetchall()
        return render_template("index.html", models=sample(models, 9), form=form)
    except mysql.connector.Error as err:
        print(f"Error: {err}")



@app.route("/account")
def account():
    form = LoginForm()
    compuStoreCursor.execute("SELECT * FROM CustomerAccount where={}".format(session["account_id"]))
    user = compuStoreCursor.fetchone()
    return render_template("account.html",user=user,form=form)


@app.route("/registration", methods=["GET", "POST"])
def registration():
    form = LoginForm()
    signform = SignupForm()

    if request.method == 'POST':
        if signform.validate_on_submit():
            try:
                # ... (your existing code)
                #with get_database_connection() as connection:
                    with compuStoreConnection.cursor(prepared=True) as compuStoreCursor:
                        # Your existing code for database operations here
                        name = signform.name.data
                        email = signform.email.data
                        gender = signform.gender.data
                        password = signform.password.data
                        confirmpassword = signform.confirmpassword.data

                        compuStoreCursor.execute("SELECT * FROM CustomerAccount WHERE email LIKE '{}' LIMIT 1".format(email))
                        test = compuStoreCursor.fetchone()

                        if test is None:
                            sql_insert_data_query = "INSERT INTO CustomerAccount(email,password,name,gender) VALUES (%s,%s,%s,%s)"
                            insert_data = (email, generate_password_hash(password, method="pbkdf2:sha256"), name, gender)
                            compuStoreCursor.execute(sql_insert_data_query, insert_data)
                            compuStoreConnection.commit()

                            sql_data_query = "SELECT account_id FROM CustomerAccount WHERE email LIKE %s"
                            compuStoreCursor.execute(sql_data_query, (email,))
                            user = compuStoreCursor.fetchone()

                            session["account_id"] = user[0]
                            compuStoreCursor.execute("SELECT cart_id FROM CustomerCart WHERE account_id = %s LIMIT 1", (session["account_id"],))
                            cart = compuStoreCursor.fetchone()

                            session["cart_id"] = cart[0]
                            session["type"] = "admin" if session["account_id"] == 1 else "normal"

                            flash('Sign-up was successful.', 'success')
                            next_page = request.args.get('next')
                            return redirect(url_for('registration'))
                        else:
                            flash("Already a member", 'danger')

            except mysql.connector.Error as error:
                print("Error connecting to the database: {}".format(error))

    # Return the template in case of form validation failure
    return render_template("registration.html", form=form, sform=signform)



@app.route("/login", methods=["GET", "POST"])
def login():
    form = LoginForm()
    if request.method == "POST":
        print("work1")
        if form.validate_on_submit():
            print("work2")
            email = form.email.data
            password = form.password.data 
            print(email,password)
    
            compuStoreCursor.execute("SELECT account_id, password FROM CustomerAccount where email like '{}' LIMIT 1".format(email))
            user = compuStoreCursor.fetchone()
            
            # Fetch the result before executing another query
            compuStoreConnection.commit()

            print(user)
            if user and check_password_hash(user[1], password):
                print("work3")
                session["account_id"] = user[0]
                flash('You have logged in successfully.', 'success')
                return redirect(url_for("index"))
    return redirect(url_for("index"))  # Redirect to a secure-page route instead

         
@app.route("/logout")
def logout():
        session.pop('account_id', None)
        session.pop('type', None)
        flash('You have been logged out.', 'logout')
        return redirect(url_for('index'))
    


@app.route("/", methods=["GET", "POST"])
def get_data():
        if request.method == "GET":
            pass # do something

@app.context_processor
def context_processor():
    return dict(name='vale')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000, debug=True)
