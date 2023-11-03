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
using  Hospital163.DB;
using static Hospital163.ClassHelper.EFClass;

namespace Hospital163.Windows
{
    /// <summary>
    /// Логика взаимодействия для FutureAppotamen.xaml
    /// </summary>
    public partial class FutureAppotamen : Window
    {
        public FutureAppotamen()
        {
            InitializeComponent();
            cbEmp.ItemsSource = context.Employee.ToList();
            cbEmp.SelectedIndex = 0;
            cbEmp.DisplayMemberPath = "LName";


            cbOrd.ItemsSource = context.MedicalService.ToList();
            cbOrd.SelectedIndex = 0;
            cbOrd.DisplayMemberPath = "TitleService";
        }

        private void zapis_Click(object sender, RoutedEventArgs e)
        {






            DB.Appointment appointment = new Appointment();
            appointment.EmployeeID = (cbEmp.SelectedItem as DB.Employee).ID;
            appointment.MedicalServiceID = (cbOrd.SelectedItem as DB.MedicalService).ID;
            appointment.DataService = Convert.ToDateTime(data.Text);
            context.Appointment.Add(appointment);
            context.SaveChanges();
            MessageBox.Show("ок");


        }
        private void zz_Click(object sender, RoutedEventArgs e) 
        {

            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }
    }
}
