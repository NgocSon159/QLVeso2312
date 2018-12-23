using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace STSShop
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "AdminHome", action = "IndexAdmin", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "dangnhap",
                url: "dang-nhap",
                defaults: new { controller = "Home", action = "dangnhap", id = UrlParameter.Optional }
                
            );
            routes.MapRoute(
              name: "Product Detail",
              url: "{controller}/{action}/{id}",
              defaults: new { controller = "Product", action = "Detail", id = UrlParameter.Optional }
              //namespaces: new[] { "STSShop.Controllers" }
          );
            routes.MapRoute(
              name: "Xac nhan",
              url: "{controller}/{action}/{madh}",
              defaults: new { controller = "Cart", action = "Xacnhan", madh = UrlParameter.Optional },
              namespaces: new[] { "STSShop.Controllers" }
          );
            routes.MapRoute(
              name: "chi-tiet-san-pham",
              url: "{chi}-{tiet}/{id}",
              defaults: new { controller = "Product", action = "Detail", id = UrlParameter.Optional },
              namespaces: new[] { "STSShop.Controllers" }
          );
            routes.MapRoute(
            name: "Add Cart",
            url: "{controller}/{action}/{masp}",
            defaults: new { controller = "Cart", action = "AddItem", masp = UrlParameter.Optional},
            namespaces: new[] { "STSShop.Controllers" }
        );
            routes.MapRoute(
              name: "Search",
              url: "tim-kiem",
              defaults: new { controller = "Product", action = "Search", id = UrlParameter.Optional },
              namespaces: new[] { "STSShop.Controllers" }
          );
            routes.MapRoute(
            name: "Product",
            url: "{controller}/{action}/{maloai}",
            defaults: new { controller = "Home", action = "Product", maloai = UrlParameter.Optional },
            namespaces: new[] { "STSShop.Controllers" }
        );
        }
    }
}
