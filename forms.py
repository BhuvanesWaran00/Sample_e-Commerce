from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, BooleanField, SelectField, TextAreaField, ValidationError
from wtforms.validators import DataRequired,EqualTo,Email,Length, InputRequired
from flask_wtf.file import FileField, FileRequired, FileAllowed


class LoginForm(FlaskForm):
    email = StringField('Email', validators=[DataRequired(), Email()], render_kw={"placeholder": "eg. joe@example.com"})
    password = PasswordField('Password', validators=[InputRequired()])

class SignupForm(FlaskForm):
    name = StringField('Name', validators=[DataRequired()])
    email = StringField('Email', validators=[DataRequired(), Email()], render_kw={"placeholder": "eg. joe@example.com"})
    gender = SelectField('Gender', choices=[('Male','Male'), ('Female', 'Female')])
    password = PasswordField('Password', validators=[DataRequired(),Length(min=5,max=100,message="must be aleast 6 characters or more"),EqualTo('confirmpassword', message='Passwords must match')])
    confirmpassword = PasswordField('ConfirmPassword', validators=[DataRequired()])

class Search(FlaskForm):
    search =StringField('search', validators=[DataRequired()])