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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Hospital163
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void btnDannie_Click(object sender, RoutedEventArgs e)
        {

            Windows.MyDannie myDannie = new Windows.MyDannie();
            myDannie.Show();
            this.Close();

        }

        private void btHistory_Click(object sender, RoutedEventArgs e)
        {
            Windows.MyHistory myHistory = new Windows.MyHistory();
            myHistory.Show();
            this.Close();

        }

        private void btZapbs_Click(object sender, RoutedEventArgs e)
        {
            Windows.FutureAppotamen futureAppotamen = new Windows.FutureAppotamen();
            futureAppotamen.Show();
            this.Close();
        }
    }
}
