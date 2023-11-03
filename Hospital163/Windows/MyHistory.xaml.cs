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
using static Hospital163.ClassHelper.AufClass;
using static Hospital163.ClassHelper.EFClass;
using Hospital163.DB;

namespace Hospital163.Windows
{
    /// <summary>
    /// Логика взаимодействия для MyHistory.xaml
    /// </summary>
    public partial class MyHistory : Window
    {
        public MyHistory()
        {
            InitializeComponent();

            gridhist.ItemsSource = context.history.ToList().Where(i => i.ID == ClassHelper.AufClass.Patient.ID);
            
        }

        private void ff_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }
    }
}
