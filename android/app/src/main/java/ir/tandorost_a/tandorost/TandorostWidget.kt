// Import will depend on App ID.
package ir.tandorost_a.tandorost

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.widget.RemoteViews
import java.io.File
import es.antonborri.home_widget.HomeWidgetPlugin
import android.app.PendingIntent
import android.content.Intent



/**
 * Implementation of App Widget functionality.
 */
class TandorostWidget : AppWidgetProvider() {
    override fun onUpdate(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetIds: IntArray,
    ) {
        for (appWidgetId in appWidgetIds) {
            // Get reference to SharedPreferences
            val widgetData = HomeWidgetPlugin.getData(context)
            val views = RemoteViews(context.packageName, R.layout.tandorost_widget).apply {

                // fix filename and check update widget
                val imageName = widgetData.getString("filename", null)
                if (imageName != null && imageName.isNotBlank()) {
                    val imageFile = File(imageName)
                    val imageExists = imageFile.exists()
                    if (imageExists) {
                        val myBitmap: Bitmap? = BitmapFactory.decodeFile(imageFile.absolutePath)
                        if (myBitmap != null) {
                            setImageViewBitmap(R.id.widget_image, myBitmap)
                        } else {
                            println("Failed to decode image: $imageName")
                            setImageViewResource(R.id.widget_image, android.R.drawable.star_big_on) // Use a default image
                        }
                    } else {
                        println("Image not found! Looked @: $imageName")
                        setImageViewResource(R.id.widget_image, android.R.drawable.star_big_on) // Use a default image
                    }
                } else {
                    println("Image filename is null or blank")
                    setImageViewResource(R.id.widget_image, android.R.drawable.star_big_on) // Use a default image
                }
                // To open app
                val intent = Intent(context, MainActivity::class.java)
                val pendingIntent = PendingIntent.getActivity(
                    context, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
                )
                setOnClickPendingIntent(R.id.widget_open_app_button, pendingIntent)
            }

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}
