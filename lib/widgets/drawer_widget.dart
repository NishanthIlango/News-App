import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/inner_screens/bookmarks_screen.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/widgets/vertical_spacing.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}):super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Drawer(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Image.asset('assets/images/newspaper.png',)
                  ,),
                  VerticalSpacing(20),
                  Flexible(child: Text("News app",style: GoogleFonts.lobster(
                    textStyle: TextStyle(
                      fontSize: 20,
                      letterSpacing: 0.6
                    )
                  ),))
                ],
              ),),
              VerticalSpacing(20),
              ListTileWidget(
                icon: IconlyBold.home,
                label: "Home",
                fct: (){},
              ),
              ListTileWidget(
                icon: IconlyBold.bookmark,
                label: "Bookmark",
                fct: (){
                  Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: BookmarkScreen(),
                      inheritTheme: true,
                      ctx: context),
                );
                },
              ),
              Divider(
                thickness: 2,
              ),
              SwitchListTile(
            title: Text(themeProvider.getDarkTheme? 'Dark': 'Light',style: TextStyle(fontSize: 20),),
            secondary: Icon(
              themeProvider.getDarkTheme
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color: Theme.of(context).colorScheme.secondary,
            ),
            value: themeProvider.getDarkTheme,
            onChanged: (bool value) {
              themeProvider.setDarkTheme = value;
            },
          ),
          ],
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,required this.label,
    required this.fct,
    required this.icon
  });
  final String label;
  final Function fct;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,
      color: Theme.of(context).colorScheme.secondary,),
      title: Text(label,style: TextStyle(
        fontSize: 20,
      ),),
      onTap: (){fct();},
    );
  }
}