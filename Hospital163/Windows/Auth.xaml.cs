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
using Hospital163.ClassHelper;

namespace Hospital163.Windows
{
    /// <summary>
    /// Логика взаимодействия для Auth.xaml
    /// </summary>
    public partial class Auth : Window
    {
        public Auth()
        {
            InitializeComponent();
        }

        private void btnVhod_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(tbLogin.Text))
            {
                MessageBox.Show("Логи не может быть пустым");
                return;
            }
            if (string.IsNullOrWhiteSpace(tbPassword.Text))
            {
                MessageBox.Show("Пароль не может быть пустым");
                return;
            }


            var auth = context.Patient.ToList()
                .Where(i => i.Password == tbPassword.Text && i.Login == tbLogin.Text).FirstOrDefault();
            if (auth != null)
            {
                AufClass.Patient = auth;
                MainWindow mainWindow = new MainWindow();
                mainWindow.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("нет такого пользователя");

            }
        }

        private void btnReg_Click(object sender, RoutedEventArgs e)
        {
            Windows.Reg reg = new Reg();
            reg.Show();
            this.Close();
        }
    }
}
