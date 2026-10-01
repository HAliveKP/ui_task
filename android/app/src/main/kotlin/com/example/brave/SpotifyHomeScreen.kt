package com.example.brave

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

class SpotifyHomeActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MaterialTheme(
                colorScheme = darkColorScheme(
                    background = Color(0xFF121212),
                    surface = Color(0xFF121212)
                )
            ) {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    SpotifyHomeScreen()
                }
            }
        }
    }
}

@Composable
fun SpotifyHomeScreen(modifier: Modifier = Modifier) {
    val scrollState = rememberScrollState()

    Column(
        modifier = modifier
            .fillMaxSize()
            .background(Color(0xFF121212))
            .verticalScroll(scrollState)
            .padding(16.dp)
            .navigationBarsPadding()
    ) {
        Row(
            modifier = Modifier.fillMaxWidth(),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "Recently played",
                fontSize = 22.sp,
                fontWeight = FontWeight.Bold,
                color = Color.White
            )
            Spacer(modifier = Modifier.weight(1f))
            Row(horizontalArrangement = Arrangement.spacedBy(16.dp)) {
                HeaderIcon(shape = "bell")
                HeaderIcon(shape = "clock")
                HeaderIcon(shape = "gear")
            }
        }

        Spacer(modifier = Modifier.height(20.dp))

        LazyRow(
            horizontalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            item {
                RecentArtistItem(
                    name = "Lana Del Rey",
                    avatarColor = Color(0xFF8B6B4D)
                )
            }
            item {
                RecentArtistItem(
                    name = "Marvin Gaye",
                    avatarColor = Color(0xFF555555)
                )
            }
        }

        Spacer(modifier = Modifier.height(28.dp))

        Row(
            verticalAlignment = Alignment.CenterVertically
        ) {
            Box(
                modifier = Modifier
                    .size(52.dp)
                    .clip(RoundedCornerShape(4.dp))
                    .background(Color(0xFF333333)),
                contentAlignment = Alignment.Center
            ) {
                Text(
                    text = "2021",
                    fontSize = 11.sp,
                    fontWeight = FontWeight.Black,
                    color = Color(0xFFD3E06C)
                )
            }
            Spacer(modifier = Modifier.width(12.dp))
            Column {
                Text(
                    text = "#SPOTIFYWRAPPED",
                    fontSize = 11.sp,
                    fontWeight = FontWeight.Bold,
                    color = Color(0xFF999999)
                )
                Text(
                    text = "Your 2021 in review",
                    fontSize = 24.sp,
                    fontWeight = FontWeight.Bold,
                    color = Color.White
                )
            }
        }

        Spacer(modifier = Modifier.height(16.dp))

        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            WrappedCardItem(
                modifier = Modifier.weight(1f),
                cardTitle = "Your Top Songs 2021",
                cardSubtitle = "Your Top Songs\n2021",
                backgroundColor = Color(0xFFCCD968),
                accentColor = Color(0xFF2C223B)
            )
            WrappedCardItem(
                modifier = Modifier.weight(1f),
                cardTitle = "Your Artists Revealed",
                cardSubtitle = "Your Artists\nRevealed",
                backgroundColor = Color(0xFFA5A8F3),
                accentColor = Color(0xFF2B21B2)
            )
        }

        Spacer(modifier = Modifier.height(28.dp))

        Text(
            text = "Editor’s picks",
            fontSize = 22.sp,
            fontWeight = FontWeight.Bold,
            color = Color.White
        )

        Spacer(modifier = Modifier.height(16.dp))

        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            EditorPickCard(
                modifier = Modifier.weight(1f),
                coverColor = Color(0xFF1E3A20),
                titleText = "A1",
                artists = "Ed Sheeran, Big Sean, Juice WRLD, Post Malone"
            )
            EditorPickCard(
                modifier = Modifier.weight(1f),
                coverColor = Color(0xFF2A5245),
                titleText = "FRONT\nLEFT",
                artists = "Mitski, Tame Impala, Glass Animals, Charli XCX"
            )
        }
    }
}

@Composable
fun HeaderIcon(shape: String, modifier: Modifier = Modifier) {
    Box(
        modifier = modifier
            .size(24.dp)
            .background(Color.Transparent),
        contentAlignment = Alignment.Center
    ) {
        Canvas(modifier = Modifier.fillMaxSize()) {
            when (shape) {
                "bell" -> {
                    drawCircle(
                        color = Color.White,
                        radius = size.minDimension / 3,
                        style = androidx.compose.ui.graphics.drawscope.Stroke(width = 2.dp.toPx())
                    )
                }
                "clock" -> {
                    drawCircle(
                        color = Color.White,
                        radius = size.minDimension / 2.5f,
                        style = androidx.compose.ui.graphics.drawscope.Stroke(width = 2.dp.toPx())
                    )
                    drawLine(
                        color = Color.White,
                        start = Offset(size.width / 2, size.height / 2),
                        end = Offset(size.width / 2, size.height / 4),
                        strokeWidth = 2.dp.toPx()
                    )
                    drawLine(
                        color = Color.White,
                        start = Offset(size.width / 2, size.height / 2),
                        end = Offset(size.width * 0.7f, size.height / 2),
                        strokeWidth = 2.dp.toPx()
                    )
                }
                else -> {
                    drawCircle(
                        color = Color.White,
                        radius = size.minDimension / 3,
                        style = androidx.compose.ui.graphics.drawscope.Stroke(width = 2.dp.toPx())
                    )
                }
            }
        }
    }
}

@Composable
fun RecentArtistItem(
    name: String,
    avatarColor: Color,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier.width(100.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Box(
            modifier = Modifier
                .size(100.dp)
                .clip(CircleShape)
                .background(avatarColor),
            contentAlignment = Alignment.Center
        ) {
            Text(
                text = name.take(1),
                fontSize = 28.sp,
                fontWeight = FontWeight.Bold,
                color = Color.White
            )
        }
        Spacer(modifier = Modifier.height(8.dp))
        Text(
            text = name,
            fontSize = 12.sp,
            fontWeight = FontWeight.Bold,
            color = Color.White,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis
        )
    }
}

@Composable
fun WrappedCardItem(
    cardTitle: String,
    cardSubtitle: String,
    backgroundColor: Color,
    accentColor: Color,
    modifier: Modifier = Modifier
) {
    Column(modifier = modifier) {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .aspectRatio(1f)
                .clip(RoundedCornerShape(4.dp))
                .background(backgroundColor)
                .padding(12.dp)
        ) {
            Box(
                modifier = Modifier
                    .size(16.dp)
                    .clip(CircleShape)
                    .background(accentColor)
                    .align(Alignment.TopStart)
            )

            Text(
                text = cardSubtitle,
                fontSize = 18.sp,
                fontWeight = FontWeight.Black,
                color = accentColor,
                lineHeight = 20.sp,
                modifier = Modifier.align(Alignment.BottomStart)
            )
        }
        Spacer(modifier = Modifier.height(8.dp))
        Text(
            text = cardTitle,
            fontSize = 13.sp,
            fontWeight = FontWeight.Bold,
            color = Color.White,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis
        )
    }
}

@Composable
fun EditorPickCard(
    coverColor: Color,
    titleText: String,
    artists: String,
    modifier: Modifier = Modifier
) {
    Column(modifier = modifier) {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .aspectRatio(1f)
                .clip(RoundedCornerShape(4.dp))
                .background(coverColor)
                .padding(12.dp)
        ) {
            Box(
                modifier = Modifier
                    .size(16.dp)
                    .clip(CircleShape)
                    .background(Color.White)
                    .align(Alignment.TopStart)
            )

            Text(
                text = titleText,
                fontSize = 22.sp,
                fontWeight = FontWeight.Black,
                color = Color.White,
                lineHeight = 24.sp,
                modifier = Modifier.align(Alignment.Center)
            )
        }
        Spacer(modifier = Modifier.height(8.dp))
        Text(
            text = artists,
            fontSize = 12.sp,
            color = Color(0xFFA7A7A7),
            maxLines = 2,
            overflow = TextOverflow.Ellipsis,
            lineHeight = 16.sp
        )
    }
}

@Preview(showBackground = true, backgroundColor = 0xFF121212)
@Composable
fun SpotifyHomeScreenPreview() {
    MaterialTheme(
        colorScheme = darkColorScheme(
            background = Color(0xFF121212),
            surface = Color(0xFF121212)
        )
    ) {
        SpotifyHomeScreen()
    }
}
