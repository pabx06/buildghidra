diff --git a/Ghidra/Features/Base/src/main/java/ghidra/app/plugin/core/function/editor/FunctionEditorDialog.java b/Ghidra/Features/Base/src/main/java/ghidra/app/plugin/core/function/editor/FunctionEditorDialog.java
index da0ecfab2..da788c5cc 100644
--- a/Ghidra/Features/Base/src/main/java/ghidra/app/plugin/core/function/editor/FunctionEditorDialog.java
+++ b/Ghidra/Features/Base/src/main/java/ghidra/app/plugin/core/function/editor/FunctionEditorDialog.java
@@ -222,9 +222,9 @@ public class FunctionEditorDialog extends DialogComponentProvider implements Mod
 		scroll = new JScrollPane(verticalScrollPanel);
 		scroll.setBorder(null);
 		scroll.setOpaque(true);
-		scroll.setBackground(Color.WHITE);
+		scroll.setBackground(Color.BLACK);
 		scroll.getViewport().setBackground(new Color(0, 0, 0, 0)); // transparent
-		scroll.getViewport().setBackground(Color.WHITE);
+		scroll.getViewport().setBackground(Color.BLACK);
 		previewPanel.add(scroll, BorderLayout.CENTER);
 		previewPanel.setBorder(BorderFactory.createLoweredBevelBorder());
 		scroll.getViewport().addMouseListener(new MouseAdapter() {
@@ -819,7 +819,7 @@ public class FunctionEditorDialog extends DialogComponentProvider implements Mod
 			Composite originalComposite = g2d.getComposite();
 			g2d.setComposite(alphaComposite);
 
-			g.setColor(Color.white);
+			g.setColor(Color.black);
 			g.fillRect(bounds.x, bounds.y, bounds.width, bounds.height);
 
 			g2d.setComposite(originalComposite);
