//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Hospital163.DB
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        public int ID { get; set; }
        public int AppointmentID { get; set; }
        public int PatientID { get; set; }
        public decimal TotalPrice { get; set; }
    
        public virtual Appointment Appointment { get; set; }
        public virtual Patient Patient { get; set; }
    }
}
