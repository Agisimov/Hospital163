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
using Hospital163.DB;
using static Hospital163.ClassHelper.EFClass;
using Hospital163.ClassHelper;

namespace Hospital163.Windows
{
    /// <summary>
    /// Логика взаимодействия для MyDannie.xaml
    /// </summary>
    public partial class MyDannie : Window
    {
        public MyDannie()
        {
            InitializeComponent();

            fjj.Text = AufClass.Patient.LName + " " + AufClass.Patient.FName + " " + AufClass.Patient.MName;
            l.Text = AufClass.Patient.DateOfBirthday.ToString();
            tele.Text = AufClass.Patient.Phone.ToString();
            pol.Text = AufClass.Patient.Gender.Name;
            adres.Text = AufClass.Patient.Address.ToString();
            pjchta.Text = AufClass.Patient.Email.ToString();



        }
        private void zzz_Click(object sender, RoutedEventArgs e)
        {

            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }

        private void izmena_Click(object sender, RoutedEventArgs e)
        {
            Windows.EdditDannie edditDannie = new EdditDannie();
            edditDannie.Show();
            this.Close();
        }
    }
}
