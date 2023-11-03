using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using static Hospital163.ClassHelper.EFClass;
using  Hospital163.DB;


namespace Hospital163.Windows
{
    /// <summary>
    /// Логика взаимодействия для Reg.xaml
    /// </summary>
    public partial class Reg : Window
    {
        public Reg()
        {
            InitializeComponent();
        }

        private void btnVhod_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(tbFname.Text))
            {
                MessageBox.Show("Имя не может быть пустым");
                return;
            }
            if (string.IsNullOrWhiteSpace(tbLname.Text))
            {
                MessageBox.Show("Фамилия не может быть пустым");
                return;
            }
            if (string.IsNullOrWhiteSpace(tbPatrname.Text))
            {
                MessageBox.Show("Отчество не может быть пустым");
                return;
            }
            if (string.IsNullOrWhiteSpace(tbAdress.Text))
            {
                MessageBox.Show("Адресс не может быть пустым");
                return;
            }
            if (string.IsNullOrWhiteSpace(tbPhone.Text))
            {
                MessageBox.Show("Телефон не может быть пустым");
                return;
            }
            if (string.IsNullOrWhiteSpace(tbEmail.Text))
            {
                MessageBox.Show("почта не может быть пустым");
                return;
            }
            if (string.IsNullOrWhiteSpace(tbLog.Text))
            {
                MessageBox.Show("Логин не может быть пустым");
                return;
            }
            if (string.IsNullOrWhiteSpace(tbPass.Text))
            {
                MessageBox.Show("Пароль не может быть пустым");
                return;
            }


            var auth = context.Patient.ToList().Where(i => i.Login == tbLog.Text).FirstOrDefault();
            if (auth != null)
            {
                MessageBox.Show("логин занят");
            }


            DB.Patient patient = new Patient();
            patient.FName = tbFname.Text;
            patient.LName = tbLname.Text;
            patient.MName = tbLname.Text;
            patient.Address = tbAdress.Text;
            patient.Phone = tbPhone.Text;
            patient.Email = tbEmail.Text;
            patient.Login = tbLog.Text;
            patient.Password = tbPass.Text;
            context.Patient.Add(patient);
            context.SaveChanges();
            MessageBox.Show("красава, ок");

            Auth auth1 = new Auth();
            auth1.Show();
            this.Close();



        }
    }
}
