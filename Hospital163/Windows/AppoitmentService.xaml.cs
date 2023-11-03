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
using Hospital163.DB;

namespace Hospital163.Windows
{
    /// <summary>
    /// Логика взаимодействия для AppoitmentService.xaml
    /// </summary>
    public partial class AppoitmentService : Window
    {
        public AppoitmentService()
        {
            InitializeComponent();

            cbEmp.ItemsSource = context.Employee.ToList();

        }
    }
}
