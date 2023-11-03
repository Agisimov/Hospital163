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
    /// Логика взаимодействия для EdditDannie.xaml
    /// </summary>
    public partial class EdditDannie : Window
    {
        public EdditDannie()
        {
            InitializeComponent();
            FName.Text = AufClass.Patient.FName;
            Lname.Text = AufClass.Patient.LName;
            Mname.Text = AufClass.Patient.MName;
            datee.Text = AufClass.Patient.DateOfBirthday.ToString();
            tele.Text = AufClass.Patient.Phone.ToString();
            pol.Text = AufClass.Patient.Gender.Name;
            adres.Text = AufClass.Patient.Address.ToString();
            pjchta.Text = AufClass.Patient.Email.ToString();

            pol.ItemsSource = context.Gender.ToList();
              pol.SelectedIndex = 0;
            pol.DisplayMemberPath = "Name";
        }

        private void izmena_Click(object sender, RoutedEventArgs e)
        {
            var user = AufClass.Patient;
            user.LName = Lname.Text;
            user.LName = FName.Text;
            user.MName = Mname.Text;
            user.DateOfBirthday = datee.SelectedDate.Value;
            user.Phone = tele.Text;
            user.GenderID = (pol.SelectedItem as Gender).ID;
           
            context.SaveChanges();
            MessageBox.Show("окккккк");

        }

        private void nax_Click(object sender, RoutedEventArgs e)
        {
            MyDannie myDannie = new MyDannie();
            myDannie.Show();
            this.Close();

        }
    }
}
