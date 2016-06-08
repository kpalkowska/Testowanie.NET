﻿#pragma checksum "C:\Users\admin\Documents\Visual Studio 2015\Projects\MyApp\MyApp\AddPage.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "716D4B6723E80989EC2348B656D25C71"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyApp
{
    partial class AddPage : 
        global::Windows.UI.Xaml.Controls.Page, 
        global::Windows.UI.Xaml.Markup.IComponentConnector,
        global::Windows.UI.Xaml.Markup.IComponentConnector2
    {
        internal class XamlBindingSetters
        {
            public static void Set_Windows_UI_Xaml_Controls_ItemsControl_ItemsSource(global::Windows.UI.Xaml.Controls.ItemsControl obj, global::System.Object value, string targetNullValue)
            {
                if (value == null && targetNullValue != null)
                {
                    value = (global::System.Object) global::Windows.UI.Xaml.Markup.XamlBindingHelper.ConvertValue(typeof(global::System.Object), targetNullValue);
                }
                obj.ItemsSource = value;
            }
        };

        private class AddPage_obj1_Bindings :
            global::Windows.UI.Xaml.Markup.IComponentConnector,
            IAddPage_Bindings
        {
            private global::MyApp.AddPage dataRoot;
            private bool initialized = false;
            private const int NOT_PHASED = (1 << 31);
            private const int DATA_CHANGED = (1 << 30);

            // Fields for each control that has bindings.
            private global::Windows.UI.Xaml.Controls.ListView obj6;

            public AddPage_obj1_Bindings()
            {
            }

            // IComponentConnector

            public void Connect(int connectionId, global::System.Object target)
            {
                switch(connectionId)
                {
                    case 6:
                        this.obj6 = (global::Windows.UI.Xaml.Controls.ListView)target;
                        break;
                    default:
                        break;
                }
            }

            // IAddPage_Bindings

            public void Initialize()
            {
                if (!this.initialized)
                {
                    this.Update();
                }
            }
            
            public void Update()
            {
                this.Update_(this.dataRoot, NOT_PHASED);
                this.initialized = true;
            }

            public void StopTracking()
            {
            }

            // AddPage_obj1_Bindings

            public void SetDataRoot(global::MyApp.AddPage newDataRoot)
            {
                this.dataRoot = newDataRoot;
            }

            public void Loading(global::Windows.UI.Xaml.FrameworkElement src, object data)
            {
                this.Initialize();
            }

            // Update methods for each path node used in binding steps.
            private void Update_(global::MyApp.AddPage obj, int phase)
            {
                if (obj != null)
                {
                    if ((phase & (NOT_PHASED | (1 << 0))) != 0)
                    {
                        this.Update_Skladniki(obj.Skladniki, phase);
                    }
                }
            }
            private void Update_Skladniki(global::System.Collections.ObjectModel.ObservableCollection<global::MyApp.Models.Skladnik> obj, int phase)
            {
                if((phase & ((1 << 0) | NOT_PHASED )) != 0)
                {
                    XamlBindingSetters.Set_Windows_UI_Xaml_Controls_ItemsControl_ItemsSource(this.obj6, obj, null);
                }
            }
        }
        /// <summary>
        /// Connect()
        /// </summary>
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.Windows.UI.Xaml.Build.Tasks"," 14.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public void Connect(int connectionId, object target)
        {
            switch(connectionId)
            {
            case 2:
                {
                    this.titleBox = (global::Windows.UI.Xaml.Controls.TextBox)(target);
                }
                break;
            case 3:
                {
                    this.descBox = (global::Windows.UI.Xaml.Controls.TextBox)(target);
                }
                break;
            case 4:
                {
                    this.saveBtn = (global::Windows.UI.Xaml.Controls.Button)(target);
                    #line 26 "..\..\..\AddPage.xaml"
                    ((global::Windows.UI.Xaml.Controls.Button)this.saveBtn).Click += this.saveBtn_Click;
                    #line default
                }
                break;
            case 5:
                {
                    this.skladBox = (global::Windows.UI.Xaml.Controls.Button)(target);
                }
                break;
            case 6:
                {
                    this.listaSkladnikow = (global::Windows.UI.Xaml.Controls.ListView)(target);
                }
                break;
            case 7:
                {
                    this.nowySkladnik = (global::Windows.UI.Xaml.Controls.TextBox)(target);
                }
                break;
            case 8:
                {
                    global::Windows.UI.Xaml.Controls.Button element8 = (global::Windows.UI.Xaml.Controls.Button)(target);
                    #line 42 "..\..\..\AddPage.xaml"
                    ((global::Windows.UI.Xaml.Controls.Button)element8).Click += this.newBtn_Click;
                    #line default
                }
                break;
            case 9:
                {
                    this.Narrow = (global::Windows.UI.Xaml.VisualState)(target);
                }
                break;
            case 10:
                {
                    this.Compact = (global::Windows.UI.Xaml.VisualState)(target);
                }
                break;
            case 11:
                {
                    this.Wide = (global::Windows.UI.Xaml.VisualState)(target);
                }
                break;
            default:
                break;
            }
            this._contentLoaded = true;
        }

        [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.Windows.UI.Xaml.Build.Tasks"," 14.0.0.0")]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public global::Windows.UI.Xaml.Markup.IComponentConnector GetBindingConnector(int connectionId, object target)
        {
            global::Windows.UI.Xaml.Markup.IComponentConnector returnValue = null;
            switch(connectionId)
            {
            case 1:
                {
                    global::Windows.UI.Xaml.Controls.Page element1 = (global::Windows.UI.Xaml.Controls.Page)target;
                    AddPage_obj1_Bindings bindings = new AddPage_obj1_Bindings();
                    returnValue = bindings;
                    bindings.SetDataRoot(this);
                    this.Bindings = bindings;
                    element1.Loading += bindings.Loading;
                }
                break;
            }
            return returnValue;
        }
    }
}

